# The PLTC Raspberry Pi

Physically located in the old mail room.

The chief purpose of `pltc-pi` is to maintain an SSH tunnel from
DIKU to an outside server `nixvps`. Using tools like
[`sshuttle`](https://github.com/sshuttle/sshuttle), this provides an
alternative to the official VPN services at the university. 
Any network resources which are available via an ethernet connection at
the PLTC section will be available via `pltc-pi`.

## IP Addresses
| Hostname      | IP              |
| ------------- | --------------- |
| `nixvps`      | `107.189.30.63`  |
| `pltc-pi`     | `10.175.128.14` |

## Gaining access
To gain access to `pltc-pi`, please add an account for yourself in
[users.nix](users.nix) according to the following format:
```
<user> = {
  isNormalUser = true;
  openssh.authorizedKeys.keys = [
    "<public key1>"
    "<public key2>"
    ⋮
    "<public keyn>"
    ];
  };
```
Be sure to include a public key, otherwise you won't be able to ssh in.

Once you've added your user, submit a PR with your change. When your PR is
accepted, `pltc-pi` and `nixvps` will be updated and a user will be created 
according to your specifications on each.

## Reverse SSH tunnel instructions
To SSH into `pltc-pi` from outside the university, you have to first
SSH into `nixvps`. It looks like this:
```
pltc-pi <---SSH---> nixvps <---SSH---> you
```
`pltc-pi` connects to `nixvps` on port 9725;
to reverse tunnel into `pltc-pi` from `nixvps` it's sufficient to simply do
```
ssh -p 9725 <user>@localhost -J autossh@107.189.30.63
```
but it's easier to add
```
Host nixvps
  User <user>
  HostName 107.189.30.63

Host pltc-pi
  User <user>
  Port 9725
  HostName localhost
  ProxyJump autossh@nixvps
```
to `~/.ssh/config`, after which you can ssh in via a simple
```
ssh pltc-pi
```
(Instead of adding an entry in `~/.ssh/config` for `nixvps`, you could alternatively add `107.189.30.63 nixvps` to `/etc/hosts`.)
## Accessing DIKU
### sshuttle instructions
1. Install [`sshuttle`](https://github.com/sshuttle/sshuttle)
2. Do
```
sshuttle -r pltc-pi 0/0
```

At this point, all of your network traffic will be routed through
`pltc-pi` and you'll be able to access any network resources that
you can access from the PLTC offices.

For complete instructions, see the `sshuttle`
[man page](https://sshuttle.readthedocs.io/en/stable/manpage.html).

Please remember to terminate the connection when you're done and
please only use the tunnel to access university network resources
you're otherwise unable to access. All data ultimately goes
through `nixvps`, which has a finite amount of monthly bandwidth (`1TB`/month for all
users).

#### IPv6
If you have an IPv6 IP, you'll need to use the `TPROXY` method. See
the `sshuttle`
[documentation](https://sshuttle.readthedocs.io/en/stable/tproxy.html).

### Accessing your office computer
If your office computer has an SSH daemon running and you know its IP,
you may access it remotely through `pltc-pi`:
```
ssh <user>@<ip> -J pltc-pi
```
or, add
```
Host office
  User <user>
  Port 22
  HostName <ip>
  ProxyJump <user>@pltc-pi
```
to `~/.ssh/config` and use `ssh office`.

#### Wake-on-LAN
If your office computer supports Wake-on-LAN it should
actually be possible to use `pltc-pi` to wake it up.

### Other methods
You can also use `pltc-pi` to create an HTTP or SOCKS
proxy. Additional VPN-over-SSH methods are detailed
[here](https://wiki.archlinux.org/title/VPN_over_SSH).

## Other uses
If you want to use `pltc-pi` for other things, feel free to submit an
issue or a PR.
