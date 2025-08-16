/*
  # Create logistics survey responses table

  1. New Tables
    - `survey_responses`
      - `id` (uuid, primary key)
      - `customer_name` (text, required)
      - `email` (text, required)  
      - `phone` (text, required)
      - `company_name` (text, optional)
      - `pickup_address` (text, required)
      - `delivery_address` (text, required)
      - `package_weight` (text, required)
      - `package_dimensions` (text, required)
      - `preferred_delivery_time` (text, required)
      - `special_instructions` (text, optional)
      - `created_at` (timestamp)

  2. Security
    - Enable RLS on `survey_responses` table
    - Add policy for public insert access (since it's a survey)
    - Add policy for authenticated users to read responses
*/

CREATE TABLE IF NOT EXISTS survey_responses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_name text NOT NULL,
  email text NOT NULL,
  phone text NOT NULL,
  company_name text DEFAULT '',
  pickup_address text NOT NULL,
  delivery_address text NOT NULL,
  package_weight text NOT NULL,
  package_dimensions text NOT NULL,
  preferred_delivery_time text NOT NULL,
  special_instructions text DEFAULT '',
  created_at timestamptz DEFAULT now()
);

ALTER TABLE survey_responses ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can insert survey responses"
  ON survey_responses
  FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Authenticated users can read survey responses"
  ON survey_responses
  FOR SELECT
  TO authenticated
  USING (true);