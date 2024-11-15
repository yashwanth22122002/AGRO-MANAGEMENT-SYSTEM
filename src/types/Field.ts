interface Field {
  id: number;
  name: string;
  farmer_id: number;
  area: number;
  location: string;
  soil_type: string;
  soil_ph: string;
  soil_texture: string;
  drainage: 'good' | 'moderate' | 'poor';
  slope: string;
  previous_crop: string;
  notes?: string;
  created_at: string;
}

export type { Field }; 