pipeline "learn_flowpipe" {
  step "http" "get_ipv4" {
    url = "https://api.ipify.org?format=json"
  }

  step "pipeline" "get_geo" {
    pipeline = reallyfreegeoip.pipeline.get_ip_geolocation

    args = {
      ip_address = step.http.get_ipv4.response_body.ip
    }
  }

  step "http" "get_weather" {
    url = join("", [
      "https://api.open-meteo.com/v1/forecast",
      "?latitude=${step.pipeline.get_geo.output.geolocation.latitude}",
      "&longitude=${step.pipeline.get_geo.output.geolocation.longitude}",
      "&current=temperature",
      "&forecast_days=1",
      "&daily=temperature_2m_min,temperature_2m_max,precipitation_probability_mean",
      "&temperature_unit=${step.pipeline.get_geo.output.geolocation.country_code == "US" ? "fahrenheit" : "celsius"}"
    ])
  }

  step "transform" "friendly_forecast" {
    value = join("", [
      "It is currently ",
      step.http.get_weather.response_body.current.temperature,
      step.http.get_weather.response_body.current_units.temperature,
      ", with a high of ",
      step.http.get_weather.response_body.daily.temperature_2m_max[0],
      step.http.get_weather.response_body.daily_units.temperature_2m_max,
      " and a low of ",
      step.http.get_weather.response_body.daily.temperature_2m_min[0],
      step.http.get_weather.response_body.daily_units.temperature_2m_min,
      ".  There is a ",
      step.http.get_weather.response_body.daily.precipitation_probability_mean[0],
      step.http.get_weather.response_body.daily_units.precipitation_probability_mean,
      " chance of precipitation."
    ])
  }

  output "ip_address" {
    value = step.http.get_ipv4.response_body.ip
  }

  output "latitude" {
    value = step.pipeline.get_geo.output.geolocation.latitude
  }

  output "longitude" {
    value = step.pipeline.get_geo.output.geolocation.longitude
  }

  output "forecast" {
    value = step.transform.friendly_forecast.value
  }
}

pipeline "get_astronauts" {
  step "http" "whos_in_space" {
    url    = "http://api.open-notify.org/astros"
    method = "get"
  }

  output "people_in_space" {
    value = step.http.whos_in_space.response_body.people
  }
}