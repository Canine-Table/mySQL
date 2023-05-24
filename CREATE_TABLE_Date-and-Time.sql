CREATE TABLE Date_and_Time (
    date DATE,
    time TIME,
    datetime DATETIME
);

INSERT INTO Date_and_Time VALUES(
    CURRENT_DATE(),
    CURRENT_TIME(),
    NOW()
);