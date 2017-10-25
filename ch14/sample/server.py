from flask import Flask, request
import os
import uuid
import json
import numpy as np
import gc
from resnet50 import ResNet50
from keras.preprocessing import image
from imagenet_utils import preprocess_input, decode_predictions


UPLOAD_FOLDER = 'uploads'
flask_app = Flask(__name__)
flask_app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


def recognition(img_path):
    model = ResNet50(weights='imagenet')

    img = image.load_img(img_path, target_size=(224, 224))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)

    preds = model.predict(x)

    recognition = []
    for item in decode_predictions(preds)[0]:
        tmp = {}
        _, name, value = item
        tmp['name'] = name
        tmp['value'] = float(value)
        recognition.append(tmp)

    return recognition


@flask_app.route('/upload', methods=['POST'])
def upload():
    file = request.files['file']
    extension = os.path.splitext(file.filename)[1]
    f_name = str(uuid.uuid4()) + extension
    img_path = os.path.join(flask_app.config['UPLOAD_FOLDER'], f_name)
    file.save(img_path)
    gc.collect()
    return json.dumps(recognition(img_path))


@flask_app.route('/status', methods=['GET'])
def status():
    return "ok"


if __name__ == "__main__":
    flask_app.run(host='0.0.0.0', port=8080, debug=True)
