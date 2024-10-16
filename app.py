from fastapi import FastAPI
from pydantic import BaseModel
import pickle
import numpy as np

# Create the FastAPI app
app = FastAPI()

# Load the model
file_path = "random_forest_model.pkl"
with open(file_path, 'rb') as file:
    model = pickle.load(file)

# Pydantic model for request body validation
class Features(BaseModel):
    features: list[float]

# Define a route for the home page
@app.get("/")
def home():
    return {"message": "Welcome to the ML Prediction API!"}

# Define the prediction route
@app.post("/predict")
def predict(features: Features):
    # Convert the features to a 2D array
    feature_array = np.array(features.features).reshape(1, -1)

    # Make the prediction
    prediction = model.predict(feature_array)

    # Return the prediction as JSON
    return {"prediction": prediction.tolist()}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=5001)
