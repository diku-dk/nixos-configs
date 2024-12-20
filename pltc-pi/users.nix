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
  infoscreen = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCjD7Vt+qzI3ubh0GBM32QeC8kpi8z9B4RhFH+o3RZvaGOZNU16tvrg/iIk8JtGl9eCOKlpksRgoTIloC83oJZAAcy9TdNMtzdC/VHP/BeCIX3c8a5Qg3WTDGlib2AWf9O61T2qX84dE60rWEqHhJ5LWws3tVG1Gd9j2Vz7uNExJnuWkn9mZ0l+VvLBhYnIp3Db4ZTSpKPFHWJr2tsDWVmYS/5loZBL+rqOuG7xa48Ltlfb8rHkrCkx3HcObHYjH7sMB0g2zKEidFvJL7FxkWP5XiK4XBk0UuhPzvmewNz6wBcJnEKmtBiYmMftmkZrgwwSDi2/VhDgeL8Ez9opwJn"
      "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4FAeTJKuTHjKnr2ReiaJDbBxwdTYH6M7FWTzWv0MEXsfpny9Sf0HuDOYjVFxw0kLrdlGG+HwYT1j7ReZHhTYN0cRmYsyA12iVZl3nEvdZAB1b+O7KCnJ0dXnWGRJYJQ5GLXZWCyrVGIAPiDehjnwWVDb95RhyaDcH15SseurrOmRIlrPYA4MuAhg5YwBYOPNHP3ZOPVDHXDCh852QYl00IdztD6IlqbScem8+r36Ik9XnWESdWIbEhVPg/53u7nKjH7ksRa+uX0VBaHqZ0h30l45vjA+mXE/rCnBh28kjJ88HEvXELQfkZf+KctoM8MiHUvP3jFRqICofaEXGK1LCw=="
    ];
  };
}
