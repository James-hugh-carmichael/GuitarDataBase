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
