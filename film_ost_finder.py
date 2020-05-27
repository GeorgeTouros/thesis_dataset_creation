from imdb import IMDb
import pandas as pd
from common import script_start_time, script_run_time, ask_spotify, spotify_instance

# initiate IMDb instance
ia = IMDb()
sp = spotify_instance()

def top250films():
    films = ia.get_top250_movies()
    film_ids = {}
    for film in films:
        film_id = film.movieID
        film_name = film['title']
        film_ids[film_id] = film_name
    return film_ids


def get_ost(film_id, film_name):
    ost = ia.get_movie_soundtrack(film_id)
    data = pd.DataFrame()
    for soundtrack in ost['data']['soundtrack']:
        song = list(soundtrack.keys())
        song_name = song[0]
        clean = ask_spotify(song_name, sp)
        if clean:
            song_data = {'film': film_name, 'film_id': film_id, 'imdb_song': song_name, 'spotify_song': clean['name']}
        else:
            song_data = {'film': film_name, 'film_id': film_id, 'imdb_song': song_name, 'spotify_song': None}
        data = data.append(song_data, ignore_index=True)
    return data


if __name__ == '__main__':
    script_start_time()
    print('getting films')
    films = top250films()
    osts = pd.DataFrame()
    print('getting soundtracks')
    for film in films.keys():
        film_ost = get_ost(film, films[film])
        osts = osts.append(film_ost)
    #df = pd.concat({k: pd.Series(v) for k, v in osts.items()})
    #df = df.rename_axis(['film', 'name']).reset_index()
    #df = df.rename(columns={0: 'song'})
    osts.to_csv('var\\imdb_data.csv')
    # # get the midi title catalog
    midi = pd.read_csv('var\\midi_titles.csv')
    # # merge the two based on track name
    merge = pd.merge(left=osts[osts['spotify_song'].notna()],
                     right=midi,
                     how='inner',
                     left_on='spotify_song',
                     right_on='name')
    pure = merge[['film', 'spotify_song']].drop_duplicates()
    print('There are %i matches' % len(pure))
    match_rate = 100*len(pure)/len(osts)
    merge.to_csv('var\\imdb_ost_matches.csv', index=False)
    print('The match rate is %i per cent' % match_rate)
    purer = merge['film'].drop_duplicates()
    purer.to_csv(r'var\film_list.csv', index=False)
    script_run_time()