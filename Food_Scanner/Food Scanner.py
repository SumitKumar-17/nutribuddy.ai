import tensorflow as tf
import numpy as np
from tensorflow.keras.applications.mobilenet_v2 import preprocess_input, decode_predictions
from tensorflow.keras.preprocessing import image
import tkinter as tk
from tkinter import filedialog
from PIL import Image

# Load the MobileNetV2 model
model = tf.keras.applications.MobileNetV2(weights='imagenet')

# Function to classify an image
def classify_image(img_path):
    img = image.load_img(img_path, target_size=(224, 224))
    img_array = image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)
    img_array = preprocess_input(img_array)

    predictions = model.predict(img_array)
    decoded_predictions = decode_predictions(predictions, top=1)[0]

    return decoded_predictions[0][1]

# Create a simple GUI to select an image
def select_image():
    root = tk.Tk()
    root.withdraw()  # Hide the main window

    file_path = filedialog.askopenfilename()
    return file_path

# Main function
def main():
    image_path = select_image()
    if image_path:
        predicted_class = classify_image(image_path)
        print(f"The predicted class is: {predicted_class}")

if __name__ == "__main__":
    main()
