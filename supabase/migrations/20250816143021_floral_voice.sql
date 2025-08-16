/*
  # Add testcolumn to survey responses

  1. Changes
    - Add `testcolumn` (text, optional) to `survey_responses` table
    - Column allows null values and has empty string as default

  2. Security
    - No changes to existing RLS policies needed
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'survey_responses' AND column_name = 'testcolumn'
  ) THEN
    ALTER TABLE survey_responses ADD COLUMN testcolumn text DEFAULT '';
  END IF;
END $$;