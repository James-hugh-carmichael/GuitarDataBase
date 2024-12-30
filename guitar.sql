CREATE TABLE chords (
    chord_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    chord_type VARCHAR(50),  
    formula VARCHAR(100),    
    description TEXT
);

CREATE TABLE fretboard (
    fretboard_id INT AUTO_INCREMENT PRIMARY KEY,
    chord_id INT,
    string_number INT,     
    fret_number INT,      
    is_open BOOLEAN,      
    FOREIGN KEY (chord_id) REFERENCES chords(chord_id)
);

CREATE TABLE scales (
    scale_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,  
    formula VARCHAR(100),     
    description TEXT
);

CREATE TABLE scale_patterns (
    scale_pattern_id INT AUTO_INCREMENT PRIMARY KEY,
    scale_id INT,
    string_number INT,      -- Which string (1-6)
    fret_number INT,       -- Which fret
    is_open BOOLEAN,       -- Whether the string is played open
    FOREIGN KEY (scale_id) REFERENCES scales(scale_id)
);

CREATE TABLE tuning (
    tuning_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,      
    string_6_note VARCHAR(3),      -- Note of the 6th string
    string_5_note VARCHAR(3),      -- Note of the 5th string
    string_4_note VARCHAR(3),      -- Note of the 4th string
    string_3_note VARCHAR(3),      -- Note of the 3rd string
    string_2_note VARCHAR(3),      -- Note of the 2nd string
    string_1_note VARCHAR(3)       -- Note of the 1st string
);


INSERT INTO tuning (name, string_6_note, string_5_note, string_4_note, string_3_note, string_2_note, string_1_note) VALUES
('Standard E', 'E', 'A', 'D', 'G', 'B', 'E'), 
('Drop D', 'D', 'A', 'D', 'G', 'B', 'E'), 
('Open G', 'D', 'G', 'D', 'G', 'B', 'D'), 
('Open D', 'D', 'A', 'D', 'F#', 'A', 'D'), 
('DADGAD', 'D', 'A', 'D', 'G', 'A', 'D'), 
('Open E', 'E', 'B', 'E', 'G#', 'B', 'E'), 
('Open A', 'E', 'A', 'E', 'A', 'C#', 'E'), 
('Half Step Down', 'Eb', 'Ab', 'Db', 'Gb', 'Bb', 'Eb'), 
('Full Step Down', 'D', 'G', 'C', 'F', 'A', 'D'), 
('Drop C', 'C', 'G', 'C', 'F', 'A', 'D'), 
('Drop C#', 'C#', 'G#', 'C#', 'F#', 'A#', 'D#'), 
('Drop Bb', 'Bb', 'F', 'Bb', 'Eb', 'G', 'C'), 
('Drop A', 'A', 'E', 'A', 'D', 'F#', 'B'), 
('Drop A#', 'A#', 'F#', 'A#', 'D#', 'G#', 'C#'), 
('Drop G', 'G', 'D', 'G', 'C', 'E', 'A'), 
('Drop F', 'F', 'C', 'F', 'A#', 'D', 'G'), 
('Drop E', 'E', 'B', 'E', 'A', 'D', 'G'), 
('Drop D#', 'D#', 'A#', 'D#', 'G#', 'C#', 'F#'), 
('Drop C#', 'C#', 'G#', 'C#', 'F#', 'B', 'E'), 
('Drop B', 'B', 'F#', 'B', 'E', 'G#', 'C#'), 
('Double Drop D', 'D', 'A', 'D', 'G', 'B', 'D');
('Drop B', 'B', 'F#', 'B', 'E', 'G#', 'C#'), 
('Double Drop D', 'D', 'A', 'D', 'G', 'B', 'D');


INSERT INTO chords (name, chord_type, formula, description) VALUES
('C Major', 'Major', 'C - E - G', 'A bright, happy chord, made of the root, major third, and perfect fifth.'),
('A Minor', 'Minor', 'A - C - E', 'A sadder chord, made of the root, minor third, and perfect fifth.'),
('G Major', 'Major', 'G - B - D', 'A bright and strong chord, built from the root, major third, and perfect fifth.'),
('E Minor', 'Minor', 'E - G - B', 'A melancholic chord, created from the root, minor third, and perfect fifth.'),
('D Major', 'Major', 'D - F# - A', 'A bright and strong chord, built from the root, major third, and perfect fifth.'),
('F Major', 'Major', 'F - A - C', 'A strong and full chord, consisting of the root, major third, and perfect fifth.'),
('B Major', 'Major', 'B - D# - F#', 'A bright chord with a sharp sound, made from the root, major third, and perfect fifth.'),
('D Minor', 'Minor', 'D - F - A', 'A melancholic chord made from the root, minor third, and perfect fifth.'),
('B Minor', 'Minor', 'B - D - F#', 'A darker chord with a somber quality, created from the root, minor third, and perfect fifth.'),
('F# Minor', 'Minor', 'F# - A - C#', 'A sad, haunting chord made of the root, minor third, and perfect fifth.');
('C Minor', 'Minor', 'C - Eb - G', 'A somber chord made of the root, minor third, and perfect fifth.'),
('E Major', 'Major', 'E - G# - B', 'A bright and resonant chord built from the root, major third, and perfect fifth.'),
('A Major', 'Major', 'A - C# - E', 'A bold chord with a warm sound, made of the root, major third, and perfect fifth.'),
('G Minor', 'Minor', 'G - Bb - D', 'A melancholic chord with a haunting quality.'),
('D# Major', 'Major', 'D# - G - A#', 'A sharp and clear chord, made of the root, major third, and perfect fifth.'),
('F# Major', 'Major', 'F# - A# - C#', 'A strong chord with a bright tone.'),
('F Minor', 'Minor', 'F - Ab - C', 'A dramatic and dark chord.'),
('D# Minor', 'Minor', 'D# - F# - A#', 'A soft and melancholic chord.')

-- For C Major chord (C - E - G)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(1, 6, 3, FALSE),   
(1, 5, 3, FALSE),   
(1, 4, 2, FALSE),   
(1, 3, 0, TRUE),    
(1, 2, 1, FALSE),   
(1, 1, 0, TRUE);    

--D Major
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(5, 6, 10, FALSE),   -- 6th string, 10th fret (D)
(5, 5, 7, FALSE),    -- 5th string, 7th fret (A)
(5, 4, 7, FALSE),    -- 4th string, 7th fret (F#)
(5, 3, 7, FALSE),    -- 3rd string, 7th fret (D)
(5, 2, 7, FALSE),    -- 2nd string, 7th fret (F#)
(5, 1, 7, FALSE);    -- 1st string, 7th fret (A)

--F Major
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(6, 6, 1, FALSE),    -- 6th string, 1st fret (F)
(6, 5, 3, FALSE),    -- 5th string, 3rd fret (C)
(6, 4, 3, FALSE),    -- 4th string, 3rd fret (F)
(6, 3, 2, FALSE),    -- 3rd string, 2nd fret (A)
(6, 2, 1, FALSE),    -- 2nd string, 1st fret (F)
(6, 1, 1, FALSE);    -- 1st string, 1st fret (C)

-- B Major 
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(7, 6, 2, FALSE),    -- 6th string, 2nd fret (B)
(7, 5, 4, FALSE),    -- 5th string, 4th fret (F#)
(7, 4, 4, FALSE),    -- 4th string, 4th fret (D#)
(7, 3, 4, FALSE),    -- 3rd string, 4th fret (B)
(7, 2, 4, FALSE),    -- 2nd string, 4th fret (F#)
(7, 1, 2, FALSE);    -- 1st string, 2nd fret (B)


-- For A Minor chord (A - C - E)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(2, 6, 0, TRUE),    
(2, 5, 2, FALSE),  
(2, 4, 2, FALSE),   
(2, 3, 2, FALSE),   
(2, 2, 1, FALSE),   
(2, 1, 0, TRUE);    

-- D Minor 
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(8, 6, 10, FALSE),   -- 6th string, 10th fret (D)
(8, 5, 7, FALSE),    -- 5th string, 7th fret (A)
(8, 4, 7, FALSE),    -- 4th string, 7th fret (D)
(8, 3, 7, FALSE),    -- 3rd string, 7th fret (F)
(8, 2, 6, FALSE),    -- 2nd string, 6th fret (A)
(8, 1, 5, FALSE);    -- 1st string, 5th fret (F)

-- B minor 
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(9, 6, 2, FALSE),    -- 6th string, 2nd fret (B)
(9, 5, 2, FALSE),    -- 5th string, 2nd fret (F#)
(9, 4, 4, FALSE),    -- 4th string, 4th fret (B)
(9, 3, 4, FALSE),    -- 3rd string, 4th fret (D)
(9, 2, 3, FALSE),    -- 2nd string, 3rd fret (F#)
(9, 1, 2, FALSE);    -- 1st string, 2nd fret (B)

-- F# minor
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(10, 6, 2, FALSE),   -- 6th string, 2nd fret (F#)
(10, 5, 4, FALSE),   -- 5th string, 4th fret (C#)
(10, 4, 4, FALSE),   -- 4th string, 4th fret (A)
(10, 3, 2, FALSE),   -- 3rd string, 2nd fret (F#)
(10, 2, 2, FALSE),   -- 2nd string, 2nd fret (A)
(10, 1, 2, FALSE);   -- 1st string, 2nd fret (C#)

-- C Minor (Cm)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(11, 6, 3, FALSE),    -- 6th string, 3rd fret (C)
(11, 5, 3, FALSE),    -- 5th string, 3rd fret (G)
(11, 4, 1, FALSE),    -- 4th string, 1st fret (Eb)
(11, 3, 0, TRUE),     -- 3rd string open (G)
(11, 2, 1, FALSE),    -- 2nd string, 1st fret (C)
(11, 1, 3, FALSE);    -- 1st string, 3rd fret (Eb)

-- E Major (E)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(12, 6, 0, TRUE),    -- 6th string open (E)
(12, 5, 2, FALSE),   -- 5th string, 2nd fret (B)
(12, 4, 2, FALSE),   -- 4th string, 2nd fret (E)
(12, 3, 1, FALSE),   -- 3rd string, 1st fret (G#)
(12, 2, 0, TRUE),    -- 2nd string open (B)
(12, 1, 0, TRUE);    -- 1st string open (E)

-- A Major (A)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(13, 6, 0, TRUE),    -- 6th string open (E)
(13, 5, 0, TRUE),    -- 5th string open (A)
(13, 4, 2, FALSE),   -- 4th string, 2nd fret (E)
(13, 3, 2, FALSE),   -- 3rd string, 2nd fret (A)
(13, 2, 2, FALSE),   -- 2nd string, 2nd fret (C#)
(13, 1, 0, TRUE);    -- 1st string open (E)

-- G Minor (Gm)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(14, 6, 3, FALSE),    -- 6th string, 3rd fret (G)
(14, 5, 5, FALSE),    -- 5th string, 5th fret (D)
(14, 4, 3, FALSE),    -- 4th string, 3rd fret (G)
(14, 3, 3, FALSE),    -- 3rd string, 3rd fret (Bb)
(14, 2, 3, FALSE),    -- 2nd string, 3rd fret (D)
(14, 1, 3, FALSE);    -- 1st string, 3rd fret (Bb)

-- D# Major (D#)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(15, 6, 11, FALSE),   -- 6th string, 11th fret (D#)
(15, 5, 8, FALSE),    -- 5th string, 8th fret (A#)
(15, 4, 8, FALSE),    -- 4th string, 8th fret (D#)
(15, 3, 8, FALSE),    -- 3rd string, 8th fret (G)
(15, 2, 8, FALSE),    -- 2nd string, 8th fret (A#)
(15, 1, 8, FALSE);    -- 1st string, 8th fret (D#)

-- F# Major (F#)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(16, 6, 2, FALSE),    -- 6th string, 2nd fret (F#)
(16, 5, 4, FALSE),    -- 5th string, 4th fret (C#)
(16, 4, 4, FALSE),    -- 4th string, 4th fret (F#)
(16, 3, 3, FALSE),    -- 3rd string, 3rd fret (A#)
(16, 2, 2, FALSE),    -- 2nd string, 2nd fret (F#)
(16, 1, 2, FALSE);    -- 1st string, 2nd fret (C#)

-- F Minor (Fm)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(17, 6, 1, FALSE),    -- 6th string, 1st fret (F)
(17, 5, 3, FALSE),    -- 5th string, 3rd fret (C)
(17, 4, 3, FALSE),    -- 4th string, 3rd fret (F)
(17, 3, 1, FALSE),    -- 3rd string, 1st fret (Ab)
(17, 2, 1, FALSE),    -- 2nd string, 1st fret (C)
(17, 1, 1, FALSE);    -- 1st string, 1st fret (F)

-- D# Minor (D#m)
INSERT INTO fretboard (chord_id, string_number, fret_number, is_open) VALUES
(18, 6, 11, FALSE),   -- 6th string, 11th fret (D#)
(18, 5, 6, FALSE),    -- 5th string, 6th fret (A#)
(18, 4, 8, FALSE),    -- 4th string, 8th fret (F#)
(18, 3, 8, FALSE),    -- 3rd string, 8th fret (D#)
(18, 2, 7, FALSE),    -- 2nd string, 7th fret (F#)
(18, 1, 6, FALSE);    -- 1st string, 6th fret (A#)


INSERT INTO scales (name, formula, description) VALUES
('Major Scale', 'W - W - H - W - W - W - H', 'The major scale is a seven-note scale characterized by a pattern of whole and half steps. It has a happy, bright sound.'),
('Minor Scale', 'W - H - W - W - H - W - W', 'The natural minor scale is a seven-note scale that is more somber or melancholic in nature.'),
('Pentatonic Scale', 'W - W - W+H - W - W+H', 'A five-note scale used in various genres, often blues, characterized by its simplicity.'),
('Blues Scale', 'W+H - W - H - H - W+H - W', 'A six-note scale that includes the minor pentatonic scale and the flat fifth.'), 
('Dorian Scale', 'W - H - W - W - W - H - W', 'A seven-note scale similar to the natural minor scale, but with a raised sixth.'), 
('Phrygian Scale', 'H - W - W - W - H - W - W', 'A seven-note scale that gives a Spanish or Eastern sound.'), 
('Lydian Scale', 'W - W - W - H - W - W - H', 'A seven-note scale similar to the major scale, but with a raised fourth.'), 
('Mixolydian Scale', 'W - W - H - W - W - H - W', 'A seven-note scale similar to the major scale, but with a flat seventh.'), 
('Locrian Scale', 'H - W - W - H - W - W - W', 'A seven-note scale that has a diminished sound, with a flat second, third, fifth, sixth, and seventh.'), 
('Harmonic Minor Scale', 'W - H - W - W - H - W+H - H', 'A seven-note scale with a unique, exotic sound, featuring a raised seventh.'), 
('Melodic Minor Scale', 'W - H - W - W - W - W - H');

-- Major Scale (C Major as example) with pattern on fretboard
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(1, 6, 3, FALSE),    
(1, 5, 3, FALSE),   
(1, 4, 2, FALSE),    
(1, 4, 5, FALSE),    
(1, 3, 0, TRUE),   
(1, 3, 2, FALSE),    
(1, 2, 1, FALSE),    
(1, 2, 3, FALSE);    

-- Minor Scale (A Minor as example)
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(2, 6, 0, TRUE),    
(2, 5, 2, FALSE),    
(2, 4, 2, FALSE),    
(2, 3, 2, FALSE),    
(2, 2, 1, FALSE),    
(2, 1, 0, TRUE);     

-- Blues Scale (A Blues as example) 
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES 
(3, 6, 5, FALSE),
(3, 5, 8, FALSE), 
(3, 4, 5, FALSE),
(3, 4, 6, FALSE), 
(3, 3, 5, FALSE), 
(3, 3, 7, FALSE); 

-- Dorian Scale (D Dorian as example)
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(4, 6, 10, FALSE),
(4, 5, 12, FALSE),
(4, 4, 9, FALSE),
(4, 4, 12, FALSE),
(4, 3, 9, FALSE),
(4, 3, 11, FALSE);

-- Phrygian Scale (E Phrygian as example)
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(5, 6, 12, FALSE),
(5, 5, 11, FALSE),
(5, 4, 9, FALSE),
(5, 4, 12, FALSE),
(5, 3, 9, FALSE),
(5, 2, 10, FALSE);

-- Lydian Scale (F Lydian as example)
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(6, 6, 13, FALSE),
(6, 5, 15, FALSE),
(6, 4, 12, FALSE),
(6, 4, 14, FALSE),
(6, 3, 12, FALSE),
(6, 2, 13, FALSE);

-- Mixolydian Scale (G Mixolydian as example)
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(7, 6, 15, FALSE),
(7, 5, 14, FALSE),
(7, 4, 12, FALSE),
(7, 4, 14, FALSE),
(7, 3, 12, FALSE),
(7, 2, 15, FALSE);

-- Locrian Scale (B Locrian as example)
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(8, 6, 7, FALSE),
(8, 5, 6, FALSE),
(8, 4, 5, FALSE),
(8, 4, 9, FALSE),
(8, 3, 5, FALSE),
(8, 2, 7, FALSE);

-- Harmonic Minor Scale (A Harmonic Minor as example)
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(9, 6, 5, FALSE),
(9, 5, 7, FALSE),
(9, 4, 5, FALSE),
(9, 4, 8, FALSE),
(9, 3, 5, FALSE),
(9, 2, 6, FALSE);

-- Melodic Minor Scale (A Melodic Minor as example)
INSERT INTO scale_patterns (scale_id, string_number, fret_number, is_open) VALUES
(10, 6, 5, FALSE),
(10, 5, 7, FALSE),
(10, 4, 5, FALSE),
(10, 4, 7, FALSE),
(10, 3, 6, FALSE),
(10, 2, 8, FALSE);
