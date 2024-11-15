import React from 'react';
import { Plus, MapPin } from 'lucide-react';
import type { Field } from '../types/Field';

interface FieldsSectionProps {
  fields: Field[];
  onAddField: () => void;
}

export default function FieldsSection({ fields, onAddField }: FieldsSectionProps) {
  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h2 className="text-xl font-semibold text-gray-900">My Fields</h2>
        <button
          onClick={onAddField}
          className="flex items-center space-x-2 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700"
        >
          <Plus className="h-5 w-5" />
          <span>Add Field</span>
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {fields.map((field) => (
          <div key={field.id} className="bg-white rounded-lg shadow-sm p-6">
            <div className="flex items-center space-x-3 mb-4">
              <MapPin className="h-6 w-6 text-green-600" />
              <h3 className="text-lg font-semibold">{field.name}</h3>
            </div>
            
            <div className="space-y-4">
              <div className="border-b pb-4">
                <h4 className="font-medium text-green-700 mb-2">Field Details</h4>
                <div className="space-y-2 text-sm">
                  <div className="flex justify-between">
                    <span className="text-gray-600">Area</span>
                    <span>{field.area} acres</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-gray-600">Location</span>
                    <span>{field.location}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-gray-600">Slope</span>
                    <span>{field.slope}</span>
                  </div>
                </div>
              </div>

              <div>
                <h4 className="font-medium text-green-700 mb-2">Soil Information</h4>
                <div className="space-y-2 text-sm">
                  <div className="flex justify-between">
                    <span className="text-gray-600">Soil Type</span>
                    <span>{field.soil_type}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-gray-600">pH Level</span>
                    <span>{field.soil_ph}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-gray-600">Texture</span>
                    <span>{field.soil_texture}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-gray-600">Drainage</span>
                    <span className="capitalize">{field.drainage}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
} 