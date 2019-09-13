import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/andreshun/Desktop/SAD.csv"))

let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

let sadClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sadClassifier.evaluation(on: testingData)

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Andres Hun", shortDescription: "A model trained to classify suicide, anxiety, and depression phrases.", version: "1.0")

try sadClassifier.write(to: URL(fileURLWithPath: "/Users/andreshun/Desktop/sadPhrasesClassifier.mlmodel"), metadata: metadata)

try sadClassifier.prediction(from: "happy")
