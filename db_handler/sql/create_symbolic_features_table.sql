CREATE TABLE `file_system_catalogs`.`symbolic_features`
(
    `midi_id`                                                   BIGINT        NOT NULL,
    `AverageMelodicIntervalFeature`                             DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonMelodicIntervalFeature`                          DECIMAL(7, 5) DEFAULT NULL,
    `DistanceBetweenMostCommonMelodicIntervalsFeature`          DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonMelodicIntervalPrevalenceFeature`                DECIMAL(7, 5) DEFAULT NULL,
    `RelativeStrengthOfMostCommonIntervalsFeature`              DECIMAL(7, 5) DEFAULT NULL,
    `NumberOfCommonMelodicIntervalsFeature`                     DECIMAL(7, 5) DEFAULT NULL,
    `AmountOfArpeggiationFeature`                               DECIMAL(7, 5) DEFAULT NULL,
    `RepeatedNotesFeature`                                      DECIMAL(7, 5) DEFAULT NULL,
    `ChromaticMotionFeature`                                    DECIMAL(7, 5) DEFAULT NULL,
    `StepwiseMotionFeature`                                     DECIMAL(7, 5) DEFAULT NULL,
    `MelodicThirdsFeature`                                      DECIMAL(7, 5) DEFAULT NULL,
    `MelodicFifthsFeature`                                      DECIMAL(7, 5) DEFAULT NULL,
    `MelodicTritonesFeature`                                    DECIMAL(7, 5) DEFAULT NULL,
    `MelodicOctavesFeature`                                     DECIMAL(7, 5) DEFAULT NULL,
    `DirectionOfMotionFeature`                                  DECIMAL(7, 5) DEFAULT NULL,
    `DurationOfMelodicArcsFeature`                              DECIMAL(7, 5) DEFAULT NULL,
    `SizeOfMelodicArcsFeature`                                  DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonPitchPrevalenceFeature`                          DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonPitchClassPrevalenceFeature`                     DECIMAL(7, 5) DEFAULT NULL,
    `RelativeStrengthOfTopPitchesFeature`                       DECIMAL(7, 5) DEFAULT NULL,
    `RelativeStrengthOfTopPitchClassesFeature`                  DECIMAL(7, 5) DEFAULT NULL,
    `IntervalBetweenStrongestPitchesFeature`                    DECIMAL(7, 5) DEFAULT NULL,
    `IntervalBetweenStrongestPitchClassesFeature`               DECIMAL(7, 5) DEFAULT NULL,
    `NumberOfCommonPitchesFeature`                              DECIMAL(7, 5) DEFAULT NULL,
    `PitchVarietyFeature`                                       DECIMAL(7, 5) DEFAULT NULL,
    `PitchClassVarietyFeature`                                  DECIMAL(7, 5) DEFAULT NULL,
    `RangeFeature`                                              DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonPitchFeature`                                    DECIMAL(7, 5) DEFAULT NULL,
    `PrimaryRegisterFeature`                                    DECIMAL(7, 5) DEFAULT NULL,
    `ImportanceOfBassRegisterFeature`                           DECIMAL(7, 5) DEFAULT NULL,
    `ImportanceOfMiddleRegisterFeature`                         DECIMAL(7, 5) DEFAULT NULL,
    `ImportanceOfHighRegisterFeature`                           DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonPitchClassFeature`                               DECIMAL(7, 5) DEFAULT NULL,
    `NoteDensityFeature`                                        DECIMAL(7, 5) DEFAULT NULL,
    `AverageNoteDurationFeature`                                DECIMAL(7, 5) DEFAULT NULL,
    `VariabilityOfNoteDurationFeature`                          DECIMAL(7, 5) DEFAULT NULL,
    `MaximumNoteDurationFeature`                                DECIMAL(7, 5) DEFAULT NULL,
    `MinimumNoteDurationFeature`                                DECIMAL(7, 5) DEFAULT NULL,
    `StaccatoIncidenceFeature`                                  DECIMAL(7, 5) DEFAULT NULL,
    `AverageTimeBetweenAttacksFeature`                          DECIMAL(7, 5) DEFAULT NULL,
    `VariabilityOfTimeBetweenAttacksFeature`                    DECIMAL(7, 5) DEFAULT NULL,
    `AverageTimeBetweenAttacksForEachVoiceFeature`              DECIMAL(7, 5) DEFAULT NULL,
    `AverageVariabilityOfTimeBetweenAttacksForEachVoiceFeature` DECIMAL(7, 5) DEFAULT NULL,
    `InitialTempoFeature`                                       DECIMAL(9, 5) DEFAULT NULL,
    `InitialTimeSignatureFeature`                               DECIMAL(7, 5) DEFAULT NULL,
    `CompoundOrSimpleMeterFeature`                              DECIMAL(7, 5) DEFAULT NULL,
    `TripleMeterFeature`                                        DECIMAL(7, 5) DEFAULT NULL,
    `QuintupleMeterFeature`                                     DECIMAL(7, 5) DEFAULT NULL,
    `ChangesOfMeterFeature`                                     DECIMAL(7, 5) DEFAULT NULL,
    `DurationFeature`                                           DECIMAL(9, 5) DEFAULT NULL,
    `MaximumNumberOfIndependentVoicesFeature`                   DECIMAL(7, 5) DEFAULT NULL,
    `AverageNumberOfIndependentVoicesFeature`                   DECIMAL(7, 5) DEFAULT NULL,
    `VariabilityOfNumberOfIndependentVoicesFeature`             DECIMAL(7, 5) DEFAULT NULL,
    `QualityFeature`                                            DECIMAL(7, 5) DEFAULT NULL,
    `TonalCertainty`                                            DECIMAL(7, 5) DEFAULT NULL,
    `UniqueNoteQuarterLengths`                                  DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonNoteQuarterLength`                               DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonNoteQuarterLengthPrevalence`                     DECIMAL(7, 5) DEFAULT NULL,
    `RangeOfNoteQuarterLengths`                                 DECIMAL(9, 5) DEFAULT NULL,
    `UniquePitchClassSetSimultaneities`                         DECIMAL(9, 5) DEFAULT NULL,
    `UniqueSetClassSimultaneities`                              DECIMAL(9, 5) DEFAULT NULL,
    `MostCommonPitchClassSetSimultaneityPrevalence`             DECIMAL(7, 5) DEFAULT NULL,
    `MostCommonSetClassSimultaneityPrevalence`                  DECIMAL(7, 5) DEFAULT NULL,
    `MajorTriadSimultaneityPrevalence`                          DECIMAL(7, 5) DEFAULT NULL,
    `MinorTriadSimultaneityPrevalence`                          DECIMAL(7, 5) DEFAULT NULL,
    `DominantSeventhSimultaneityPrevalence`                     DECIMAL(7, 5) DEFAULT NULL,
    `DiminishedTriadSimultaneityPrevalence`                     DECIMAL(7, 5) DEFAULT NULL,
    `TriadSimultaneityPrevalence`                               DECIMAL(7, 5) DEFAULT NULL,
    `DiminishedSeventhSimultaneityPrevalence`                   DECIMAL(7, 5) DEFAULT NULL,
    `IncorrectlySpelledTriadPrevalence`                         DECIMAL(7, 5) DEFAULT NULL,
    `ComposerPopularity`                                        DECIMAL(7, 5) DEFAULT NULL,
    `LandiniCadence`                                            DECIMAL(7, 5) DEFAULT NULL,
    `LanguageFeature`                                           DECIMAL(7, 5) DEFAULT NULL,
    PRIMARY KEY (`midi_id`),
    UNIQUE INDEX `midi_id_UNIQUE` (`midi_id` ASC) VISIBLE,
    CONSTRAINT `fk_symbolic_features_1`
        FOREIGN KEY (`midi_id`)
            REFERENCES `file_system_catalogs`.`midi_catalog` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);