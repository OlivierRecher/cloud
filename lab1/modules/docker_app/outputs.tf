output "containers" {
  value = {
    for c in docker_container.web :
    c.name => "http://localhost:${c.ports[0].external}"
  }
}
