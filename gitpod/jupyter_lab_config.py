c = get_config()

c.ServerApp.allow_password_change = False
c.ServerApp.allow_remote_access = False

#c.ServerApp.custom_display_url = 'zoose-for-gitpod:8888'
# c.ServerApp.ip = 'localhost'
# c.ServerApp.local_hostnames = ['localhost']

c.ServerApp.open_browser = False
c.ServerApp.password = ''
c.ServerApp.password_required = False
c.ServerApp.token = ''
