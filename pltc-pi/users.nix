{
  zfnmxt = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCjD7Vt+qzI3ubh0GBM32QeC8kpi8z9B4RhFH+o3RZvaGOZNU16tvrg/iIk8JtGl9eCOKlpksRgoTIloC83oJZAAcy9TdNMtzdC/VHP/BeCIX3c8a5Qg3WTDGlib2AWf9O61T2qX84dE60rWEqHhJ5LWws3tVG1Gd9j2Vz7uNExJnuWkn9mZ0l+VvLBhYnIp3Db4ZTSpKPFHWJr2tsDWVmYS/5loZBL+rqOuG7xa48Ltlfb8rHkrCkx3HcObHYjH7sMB0g2zKEidFvJL7FxkWP5XiK4XBk0UuhPzvmewNz6wBcJnEKmtBiYmMftmkZrgwwSDi2/VhDgeL8Ez9opwJn"
    ];
  };
  athas = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4FAeTJKuTHjKnr2ReiaJDbBxwdTYH6M7FWTzWv0MEXsfpny9Sf0HuDOYjVFxw0kLrdlGG+HwYT1j7ReZHhTYN0cRmYsyA12iVZl3nEvdZAB1b+O7KCnJ0dXnWGRJYJQ5GLXZWCyrVGIAPiDehjnwWVDb95RhyaDcH15SseurrOmRIlrPYA4MuAhg5YwBYOPNHP3ZOPVDHXDCh852QYl00IdztD6IlqbScem8+r36Ik9XnWESdWIbEhVPg/53u7nKjH7ksRa+uX0VBaHqZ0h30l45vjA+mXE/rCnBh28kjJ88HEvXELQfkZf+KctoM8MiHUvP3jFRqICofaEXGK1LCw=="
    ];
  };
  ola = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAp4xwI+SWN/7F+ijvE8H5XZXYUz8D7QkXUHCM+esNra"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILYtv0+yJyZccT2OpmQLHLYVCuBc2ypyHWlQkduK4KYC"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClUq5U/jHZeCuzziXCNt8hEGxH9eaNYRkCyY9LLPlcHj6GIAsE5hPnfgcm1aZ7w5zIHNW/bEKXggDrMCQb+0pZ1oeH0ghMdn6WBvs97ONjTlDEoQFhibxfFyQ/dAqhwbn5/ckglc/8kFlX9ORjJXPEdOSoUATniITizSvqZvnEFQvdI4ynzw1j9SEyxlNPHq8bMYofQ8hjdf8MIuSU8vW4ibt7lcEm8mKlbXqy1nsFuh28zSpAZJyhBZOWNP8/Onci+Lidhplse377PpBrApLlhLyHtz58CMtC+ewp9gH7EJ4b8M+LeiRY8e7U8dxwzYMcF4fp2U/dE9X7JaOAUMyJ"
    ];
  };
  frans = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCa+X/PH7hp7DpM7CvTm3hapvYZxSzr10rmDrpCSRYZxDGvdLKIsE9hBe4a/8IGMI1Qji9Vi8bX5JNv5bztTVFtfnUkhLHufmQi0cY88AKybYk6W05426k7iGiUnikR24AJvMseZ0hnwV7n87rq0VbTj1FuFCeLDrQepNB4xCTC7ugwwqmH18zV1gdWnhOZONWhKP/eufnYMtbXk3boBCZvb4l97xzlCnZUv1hfCSmEifGvkpeNsUgUksdtdG9Azq0PFoJQTP6LK2Sz+/tBf+DgW3i3ZSm3qN8CiPTD6+Xh6ML7kV4dss6nZ//5GiQQ9dwohh+iGQVLNwCZ1V4PBFDTAmVupjqJCS11yFcpqwAmxiMq4JE+yQPB+BxmOqoZ36UOYwqqDzY2Uo+GqQrH7aO+AQDYoW/p3r+K9u6kM/3kwU9OVTJth2cOciX0oJ8uM3eUsDvFIQ+9i4zi7cFdD04052SBC9AoQShszVYnv6B7xVlK0/5b0gNvNE2Eblv1rcE="
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNwxO6ZhMhuFuW0varYfxYU35DXXDhhwxO6ja9o7NdP8IZdqAuNpK78S1YuUoVeLsLCm8rZI2Wl2A2R/5kiqkz4CUCl+Iyt4oXhpxLnybBpXUMWVHdKkflj47+JKl8PoaOmscF+9LS28vMhdcjMwyXHkGL58qQtYc2RjeiTkrQfGqdF3wY2TH4TUBR4vw6UOImTiTnmbaa/XU/YBf1pWxqUUPqtjNmkUsOWih2gXuy5Nud9tkHP0hdTser32H5gHxpqwOvSnK0PIRBtOcgjJDghCFEYvwiLb6r+M1SMIH50MTENxDF8aX4F+5C433biLEhkzu1CuzuNvj5myYVVApbUByvrLrljVy9kSc2q/L8Ci2UYoiJSWz1i3woBbKZXtn8j6Fhy8Mg3LebN2OuhNqIugq5Uj5HGKXyHC7zalleWVTr+N2aXAmHJiVtkFhm2ss5r7VgbgryEBNBDGyLWBSeb0WB1dbOdKwhTL+x5QmxhAVjYH5qnQN6jE11wUYvvbk="
    ];
  };
  munksgaard = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINlapwwXZyp/qTm1y9CA5WLVL33TAAznj5FkZW4/Ftvu"
    ];
  };
  kirkedal = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIENbT1CI2qVlelSPqrdKsW43WO0sICbNXuYz3Y7eA30G"
    ];
  };
  nikolaj = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN///1LDqvrwExu4RloJ0/yfJLV1zxrGpltppPdry33x"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOJdX92TqTWTAdmMDk7n7aYAsGNMYlHMdmmFspUzTS6/"
    ];
  };
  lu = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHu17let3fjkkyo7CFBCKG0sEAQsxV5eA51mNFL6vlFU"
    ];
  };
}
