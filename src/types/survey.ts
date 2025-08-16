export interface SurveyResponse {
  id?: string;
  customer_name: string;
  email: string;
  phone: string;
  company_name?: string;
  pickup_address: string;
  delivery_address: string;
  package_weight: string;
  package_dimensions: string;
  preferred_delivery_time: string;
  special_instructions?: string;
  created_at?: string;
}