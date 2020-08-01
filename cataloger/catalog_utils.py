import os
import re

import pandas as pd

from spotify_wrapper.spotify import Spotify


def create_catalog(directory, except_dir=[], except_file=''):
    """
    Takes a directory as an input, and outputs a pandas DF with a full catalog of files and locations
    :param directory: the directory you want to be cataloged
    :param except_dir: optional argument to exclude irrelevant directories. Accepts list
    :param except_file: optional argument to exclude irrelevant files. Accepts str or compiled RegEx
    :return: Pandas DF with the relevant catalog
    """
    dirs = []
    names = []
    for dirname, dirnames, filenames in os.walk(directory):
        # remove unwanted directories
        for bad_dir in except_dir:
            if bad_dir in dirnames:
                dirnames.remove(bad_dir)

        for filename in filenames:
            if re.search(except_file, str(filename)):
                filenames.remove(filename)
            else:
                dirs.append(dirname)
                names.append(filename)
    d = {'directory': dirs, 'filename': names}

    output = pd.DataFrame.from_dict(d)
    return output


def cleanup_file_titles(df, file_type, allow_numbers=False):
    """
    get the titles of the midi files and return a DataFrame with them
    :param allow_numbers: boolean that passes to the regex cleaner function and allows numbers in the output.
    :param df: the midi track catalogue
    :param file_type: the type of files in the catalogue. Possible values: "audio", "video", "midi"
    :return: df with an extra column with titles
    """
    suffix = determine_relevant_suffices(file_type)

    titles = []
    for filename in df['filename']:
        # only keep relevant file types
        suf_search = re.search(suffix, filename)
        if suf_search:
            #strip from suffix
            stripped = suf_search.group(1)
            words = reg_cleaner(stripped, allow_numbers=allow_numbers)
            titles.append(words)
        else:
            titles.append('')

    df['title'] = titles
    df = df[df['title'] != '']
    return df


def determine_relevant_suffices(file_type):
    if file_type == "midi":
        suffix = re.compile('(.*)(\.mid|\.MID|\.Mid)')
    elif file_type == "audio":
        suffix = re.compile('(.*)(\.mp3|\.wav|\.MP3|\.WAV)')
    elif file_type == "video":
        suffix = re.compile('(.*)(\.mp4|\.mkv|\.avi)')
    else:
        raise ValueError
    return suffix


def get_clean_song_titles_from_spotify(df):
    """
    gets the dataframe of song titles and searches spotify to get their proper name
    :param df: the output of get_titles
    :return: the original df with extra columns containing url, song name and artist
    """
    songs = []
    for title in df['title']:
        song_info = Spotify.ask_spotify(title=title)
        if song_info:
            songs.append(song_info.copy())
        else:
            pass
    song_df = pd.DataFrame.from_records(songs)
    df = df.merge(right=song_df, left_on='title', right_on='clean_title', how='left')
    df.drop(columns='clean_title', inplace=True)
    df.rename(columns={'name': 'spotify_name', 'artist': 'spotify_artist', 'URL': 'spotify_URL'}, inplace=True)
    return df


FILENAME_STOPWORDS = ['bdrip', 'brrip', '1080p', '720p', 'aac',
                      'www', 'yifi', 'yts','anoxmous', 'bluray', 'hdtv', 'org', 'rcg', 'jh', 'rg2',
                      'webrip', 'criterion', 'dvdrip', 'x264', 'xvid', 'gaz', 'bz2', 'da', 'dc', 'dwb', 'jc2',
                      'dm', 'kar', 'karaoke', 'version', 'jpp', 'jk', 'mc', 'rt', 'gw', 'gc9', 'bb', 'gp', 'gl',
                      'mix', 'remix', 'dj', 'nr', 'song', 'k', 'gr', 'cm', 'v1', 'mw', 'rw', 'bz3', 'v2', 'fs'
                      ]


def reg_cleaner(string, allow_numbers=True):
    """
    simple function to convert string to lowercase and remove special characters
    :param allow_numbers: specify if you want to allow numbers or not (default yes)
    :param string: the string you want to clean
    :return: the clean string
    """
    if allow_numbers:
        remove_special = re.sub('[^A-Za-z0-9]+', ' ', string)
    else:
        remove_special = re.sub('[^A-Za-z]+', ' ', string)

    pascalcase = re.sub(r'([a-z](?=[A-Z])|[A-Z](?=[A-Z][a-z]))', r'\1 ', remove_special)

    clean_string = pascalcase.lower()

    removed_stopwords = remove_stopwords(clean_string)

    removed_multi_space = remove_multi_spaces(removed_stopwords)

    return removed_multi_space


def remove_stopwords(string):
    removed_stopwords = ' '.join([word for word in string.split() if word not in FILENAME_STOPWORDS])
    return removed_stopwords


def remove_multi_spaces(string):
    multiple_spaces = re.compile('(\s\s+)')
    stripped_string = re.sub(multiple_spaces, ' ', string)
    return stripped_string
