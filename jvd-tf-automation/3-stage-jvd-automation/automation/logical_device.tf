resource "apstra_logical_device" "vJunos_LD" {
  name = "vJunos-LD"
  panels = [
    {
      rows = 2
      columns = 5
      port_groups = [
        {
          port_count = 10
          port_speed = "1G"
          port_roles = ["spine", "leaf", "peer", "access", "generic"]
        }
      ]
    }
  ]
}