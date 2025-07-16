FROM elixir:otp-28-alpine

# Install Hex + Rebar (build tools)
RUN mix local.hex --force && \
    mix local.rebar --force

# Install dependencies for compilation
RUN apk add --no-cache build-base git

WORKDIR /app

# Copy mix files and install deps (cached if no changes)
COPY mix.exs mix.lock ./
RUN mix deps.get --only prod

COPY . .

ENV MIX_ENV=prod
ENV PORT=4000

RUN mix compile
RUN mix release

EXPOSE 4000

CMD ["_build/prod/rel/pokemon_type_chart/bin/pokemon_type_chart", "start"]
