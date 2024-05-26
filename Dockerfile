FROM ruby:3.1.2

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install the specific Bundler version
RUN gem install bundler:2.3.6

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install the gems
RUN bundle _2.3.6_ install

# Copy the rest of the application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
