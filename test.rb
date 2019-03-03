#!/usr/bin/ruby

require "json"

json_content = File.read("./test/project.config.json")

json_object = JSON.parse(json_content)

json_object["appid"] = "AFEI_TEST"

File.write("./test/project.config.json", JSON.pretty_generate(json_object))
