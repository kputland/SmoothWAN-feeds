config = Map("tinyvpnconf")

view = config:section(NamedSection,"Setup", "config",  translate("TinyFEC Configuration (cloud-init)"))
enabled = view:option(Flag, "enabled", "Enable", "Enables TinyFEC, disabling Speedify and Engarde."); view.optional=false; view.rmempty = false;
pass = view:option(Value, "pass", "Password:", "The password set in cloud-init password field."); pass.optional=false; pass.rmempty = false; pass.password=true;
server = view:option(Value, "dstAddr", "Server IP Address:", "The server IP(v4), found in provider instance info.");

function config.on_commit(self)
    luci.sys.exec("sh -c 'sleep 2 && /etc/init.d/tinyvpnconf restart' &")
end

return config