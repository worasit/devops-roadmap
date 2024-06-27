trigger "http" "devops_api" {
  method "get" {
    pipeline       = pipeline.learn_flowpipe
    execution_mode = "synchronous"
  }
}

trigger "http" "get_astronauts" {
  method "get" {
    execution_mode = "synchronous"
    pipeline       = pipeline.get_astronauts

    args = {
      headers = self.request_headers
    }
  }
}