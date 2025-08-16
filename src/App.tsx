import React from 'react';
import SurveyForm from './components/SurveyForm';

function App() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-green-50">
      <div className="container mx-auto py-8">
        <SurveyForm />
      </div>
    </div>
  );
}

export default App;