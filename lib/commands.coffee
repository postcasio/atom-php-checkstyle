{exec} = require 'child_process'

# Wrapper class for all shell commands
# Provides shelling out commands so it is performed in one place
class Shell

    # Constructor
    # @param @command The shell command we will execute
    constructor: (@command) ->

    # Executor
    # Execute the shell command
    # @param callback The callback once the shell command is complete
    execute: (callback) ->
        console.log "[php-checkstyle]" + @command.getCommand()
        exec @command.getCommand(), callback


# Phpcs command to represent phpcs
class CommandPhpcs

    # Constructor
    # @param @path   The path to the file we want to phpcs on
    # @param @config The configuration for the command (Such as coding standard)
    constructor: (@path, @config) ->

    # Getter for the command to execute
    getCommand: ->
        command = ''
        command += @config.executablePath + " --standard=" + @config.standard
        command += " -n"  if @config.warnings is false
        command += ' --report=checkstyle '
        command += @path
        return command

    # Given the report, now process into workable data
    process: (error, stdout, stderr) ->
        console.log > "[php-checkstyle][stdout] " + stdout
        console.log > "[php-checkstyle][error] " + error
        console.log > "[php-checkstyle][stderr] " + stderr

        pattern = /.*line="(.+?)" column="(.+?)" severity="(.+?)" message="(.*)" source.*/g
        errorList = []
        while (line = pattern.exec(stdout)) isnt null
            item = [line[1], line[4]]
            errorList.push item
        return errorList


# PHP CS Fixer command
class CommandPhpcsFixer

    # Constructor
    # @param @path   The path to the file we want to execute php-cs-fixer on
    # @param @config The configuration for the command such as which level
    constructor: (@path, @config) ->

    # Formulate the php-cs-fixer command
    getCommand: ->
        command = ''
        command += @config.executablePath
        command += ' --level=' + @config.level
        command += ' fix '
        command += @path
        return command

    # Process the data out of php-cs-fixer
    process: (error, stdout, stderr) ->
        console.log > "[php-checkstyle][stdout] " + stdout
        console.log > "[php-checkstyle][error] " + error
        console.log > "[php-checkstyle][stderr] " + stderr

        pattern = /.*(.+?)\) (.*)/g
        errorList = []
        while (line = pattern.exec(stdout)) isnt null
            console.log line
            item = [line[1], line[2]]
            errorList.push item
        return errorList


module.exports = {Shell, CommandPhpcs, CommandPhpcsFixer}
