-- Create table structure for marketing A/B test data

DROP TABLE IF EXISTS marketing_ab_test;

CREATE TABLE marketing_ab_test (
    user_id INT PRIMARY KEY,
    test_group VARCHAR(10) NOT NULL,
    converted INT NOT NULL CHECK (converted IN (0, 1)),
    total_ads INT NOT NULL CHECK (total_ads >= 0),
    most_ads_day VARCHAR(15) NOT NULL,
    most_ads_hour INT NOT NULL CHECK (most_ads_hour BETWEEN 0 AND 23)
);

COMMENT ON TABLE marketing_ab_test IS 'User-level marketing A/B experiment data';
COMMENT ON COLUMN marketing_ab_test.user_id IS 'Unique identifier for each user';
COMMENT ON COLUMN marketing_ab_test.test_group IS 'Experimental condition: ad (treatment) or psa (control)';
COMMENT ON COLUMN marketing_ab_test.converted IS 'Conversion outcome flag (1 = converted, 0 = did not convert)';
COMMENT ON COLUMN marketing_ab_test.total_ads IS 'Total impressions seen by the user';
COMMENT ON COLUMN marketing_ab_test.most_ads_day IS 'Day of week with the most impressions';
COMMENT ON COLUMN marketing_ab_test.most_ads_hour IS 'Hour of day (0-23) with the most impressions';