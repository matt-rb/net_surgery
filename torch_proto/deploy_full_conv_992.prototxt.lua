require 'ccn2'
local model = {}
table.insert(model, {'torch_transpose_dwhb', nn.Transpose({1,4},{1,3},{1,2})})
table.insert(model, {'conv1', ccn2.SpatialConvolution(3, 96, 11, 4, 0, 1)})
table.insert(model, {'relu1', nn.ReLU(true)})
table.insert(model, {'norm1', ccn2.SpatialCrossResponseNormalization(5, 0.000100, 0.7500, 1.000000)})
table.insert(model, {'pool1', ccn2.SpatialMaxPooling(3, 2)})
table.insert(model, {'conv2', ccn2.SpatialConvolution(96, 256, 5, 1, 2, 2)})
table.insert(model, {'relu2', nn.ReLU(true)})
table.insert(model, {'norm2', ccn2.SpatialCrossResponseNormalization(5, 0.000100, 0.7500, 1.000000)})
table.insert(model, {'pool2', ccn2.SpatialMaxPooling(3, 2)})
table.insert(model, {'conv3', ccn2.SpatialConvolution(256, 384, 3, 1, 1, 1)})
table.insert(model, {'relu3', nn.ReLU(true)})
table.insert(model, {'conv4', ccn2.SpatialConvolution(384, 384, 3, 1, 1, 2)})
table.insert(model, {'relu4', nn.ReLU(true)})
table.insert(model, {'conv5', ccn2.SpatialConvolution(384, 256, 3, 1, 1, 2)})
table.insert(model, {'relu5', nn.ReLU(true)})
table.insert(model, {'pool5', ccn2.SpatialMaxPooling(3, 2)})
table.insert(model, {'fc6-conv', ccn2.SpatialConvolution(256, 4096, 6, 1, 0, 1)})
table.insert(model, {'relu6', nn.ReLU(true)})
table.insert(model, {'drop6', nn.Dropout(0.500000)})
table.insert(model, {'fc7-conv', ccn2.SpatialConvolution(4096, 4096, 1, 1, 0, 1)})
table.insert(model, {'relu7', nn.ReLU(true)})
table.insert(model, {'drop7', nn.Dropout(0.500000)})
table.insert(model, {'fc8-conv', ccn2.SpatialConvolution(4096, 992, 1, 1, 0, 1)})
return model