# Ruigi
Ruigi is similarity calculation library, which is implemented by Ruby.

### algorithms
Now, only support TF-IDF and cosine similarity.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruigi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruigi

## Usage
1. Parse from sentence to array of words

  This gem provide parser as an optional function.

2. array of words -> Ruigi::Document
```ruby
words = ["word1", "word2", ... , "wordN"]
document1 = Ruigi::Document.new("title_of_document", words)
```

3. Make a Model from documents of array
```ruby
corpus = [document1, document2, ... , documentN] # each element's type is Ruigi::Document.
model = Ruigi::Model.new(corpus)
```
4. You can get feature vector for each document and calculate similarity between document.
```ruby
model.feature_vector_of(0) # => return feature vector of 0th document
```
etc...

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/naoki-k/ruigi.  
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

