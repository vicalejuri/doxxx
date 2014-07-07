# Run and pipe shell script output
# Will call `cb` on every pipe new data, 
# and call `end` on pipe data end
###
_run_shell = (cmd, args, cb, end) ->
    spawn = Npm.require('child_process').spawn,
    child = spawn(cmd, args)

    child.stdout.on 'data', (buffer) ->
        cb(me, buffer)
    child.stdout.on 'end', end 


# Export
if Meteor.isServer
    @run_shell = _run_shell
###
