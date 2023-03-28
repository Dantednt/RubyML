weight = rand(-1..1).to_f
bias = rand(-1..1).to_f

def sigmoid(x)
  1 / (1 + Math.exp(-x))
end

def mse(y_pred, y_actual)
  (y_actual - y_pred) ** 2
end

#train the neural network

learning_rate = 0.1
epochs = 1000
#the first element of the array is Celcius an the second element represent the corresponding fahrenheit temperature value. 
training_data = [[0, 32], [10, 5], [20, 68], [30, 86], [40, 104], [50, 122], [60, 140], [70, 158], [80, 176], [90, 194], [100, 212]]

epochs.times do |i|
  error_sum = 0

  training_data.each do |celcius, fahrenheit|
    #foward pass
    z = weight * celcius + bias
    y_pred = sigmoid(z)

    #backward pass 
    error = mse(y_pred, fahrenheit)
    d_error = 2 * (y_pred - fahrenheit) * y_pred * (1 - y_pred)
    d_weight = d_error * celcius
    d_bias = d_error

    #update weights and biases
    weight -= learning_rate * d_weight
    bias -= learning_rate * d_bias

    error_sum += error
  end

  puts "Epoch #{i+1}: error = #{error_sum / training_data.length}"
end

puts "plis put your celsius value here"
celsius = gets.chomp.to_f
z = weight * celsius + bias
fahrenheit = z * 1.8 + 32
puts "#{celsius} Celsius = #{fahrenheit} Fahrenheit"
