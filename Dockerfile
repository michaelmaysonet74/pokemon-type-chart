# Use the Elixir 1.x with OTP 28 on Alpine Linux
FROM elixir:otp-28-alpine

# Install Hex + Rebar (build tools)
RUN mix local.hex --force && \
    mix local.rebar --force

# Install dependencies for compilation
RUN apk add --no-cache build-base git

# Set working directory
WORKDIR /app

# Copy mix files and install deps (cached if no changes)
COPY mix.exs mix.lock ./
RUN mix deps.get --only prod

# Copy the whole app
COPY . .

# Compile the app
RUN MIX_ENV=prod mix compile

# Generate release (replace with `mix escript.build` for CLI apps)
RUN MIX_ENV=prod mix release

# Set environment variables
ENV MIX_ENV=prod
ENV PORT=4000

# Expose the port
EXPOSE 4000

# Run the release
CMD ["_build/prod/rel/pokemon_type_chart/bin/pokemon_type_chart", "start"]
