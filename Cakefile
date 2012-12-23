fs = require 'fs'
path = require 'path'
{spawn, exec} = require 'child_process'

coffee = (args) ->
  proc =         spawn './node_modules/.bin/coffee', args
  proc.stderr.on 'data', (buffer) -> console.log buffer.toString()
  proc.on        'exit', (status) -> process.exit(1) if status != 0

jasmine = (args) ->
  proc =         spawn './node_modules/.bin/jasmine-node', args
  proc.stdout.on 'data', (buffer) -> console.log buffer.toString()
  proc.on        'exit', (status) -> process.exit(1) if status != 0

task 'build', "build source files in './coffeescripts' to './javascripts'", ->
  invoke 'clean'
  invoke 'spec'
  coffee ['-o', 'javascripts', '-j','picpo','-c','coffeescripts']

task 'clean', 'clean out temporary build files', ->
  if fs.readdirSync('javascripts/').length > 0
    exec 'find javascripts/ -type f | xargs rm -f ', (err) ->
        throw err if err
      
task 'spec', 'run jasmine-node spec suite', ->
  jasmine ['--coffee','--verbose','specs/']
