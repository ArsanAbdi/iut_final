import matplotlib.pyplot as plt
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, Dropout, BatchNormalization
from tensorflow.keras.callbacks import ReduceLROnPlateau, EarlyStopping


# utilisation de ImageDataGenerator avec un paramètre rescale=1/255, ce qui signifie que les valeurs
# des pixels des images seront normalisées pour être comprises entre 0 et 1 (au lieu de 0 à 255).
# C’est une étape essentielle dans les modèles de deep learning pour accélérer l’apprentissage et
# améliorer la stabilité numérique.
train = ImageDataGenerator(rescale=1 / 255)
test = ImageDataGenerator(rescale=1 / 255)


# chargement des données d'entraînements et de tests
# flow_from_directory charge les images depuis des répertoires structurés pour l'entraînement et le test.
train_dataset = train.flow_from_directory("training_set",
                                          target_size=(150, 150),
                                          batch_size=32,
                                          class_mode='binary')

test_dataset = test.flow_from_directory("test_set",
                                        target_size=(150, 150),
                                        batch_size=32,
                                        class_mode='binary')

# Initialisation d'un modèle séquentiel
model = Sequential()

# Convolutional layer and maxpool layer 1
model.add(Conv2D(32, (3, 3), activation='relu', input_shape=(150, 150, 3)))
model.add(MaxPooling2D(2, 2))

# Convolutional layer and maxpool layer 2
model.add(Conv2D(64, (3, 3), activation='relu'))
model.add(MaxPooling2D(2, 2))

# Convolutional layer and maxpool layer 3
model.add(Conv2D(128, (3, 3), activation='relu'))
model.add(MaxPooling2D(2, 2))

# Convolutional layer and maxpool layer 4
model.add(Conv2D(128, (3, 3), activation='relu'))
model.add(MaxPooling2D(2, 2))

# This layer flattens the resulting image array to 1D array
model.add(Flatten())

# Hidden layer with 512 neurons and Rectified Linear Unit activation function
model.add(Dense(512, activation='relu'))

# Output layer with single neuron which gives 0 for Cat or 1 for Dog
# Here we use sigmoid activation function which makes our model output to lie between
# 0 and 1
model.add(Dense(1, activation='sigmoid'))

# Les métriques sont utilisées pour évaluer la performance du modèle.
# binary_crossentropy est une fonction de perte adaptée pour la classification binaire,
# mesurant l'erreur entre les probabilités prédites et les étiquettes réelles.
# L'optimiseur est responsable de mettre à jour les poids du modèle pendant
# l'entraînement afin de minimiser la fonction de perte.
model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

history = model.fit(train_dataset,
                    epochs=10,
                    validation_data=test_dataset,
                    callbacks=[ReduceLROnPlateau(monitor='val_loss', factor=0.2, patience=3),
                               EarlyStopping(monitor='val_loss', patience=5)])

from sklearn.metrics import classification_report

y_true = test_dataset.classes
y_pred = (model.predict(test_dataset) > 0.5).astype("int32")

print(classification_report(y_true, y_pred, target_names=['Class 0', 'Class 1']))

plt.plot(history.history['accuracy'], label='accuracy')
plt.plot(history.history['val_accuracy'], label='val_accuracy')
plt.xlabel('Epoch')
plt.ylabel('Accuracy')
plt.legend(loc='lower right')
plt.show()
