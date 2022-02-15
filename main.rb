require "rest-client"
require "colorize"
require "os"
require_relative "helpers/directories_helper"
require_relative "helpers/subdomains_helper"

def clear_terminal
    if detect_system == "Windows"
        system("cls")
    else
        system("clear")
    end
end

def detect_system
    if OS.windows?
        return "Windows"
    end
    return "Unix"
end

clear_terminal
puts "=============================================".magenta
puts "                     KARPA".magenta
puts "=============================================".magenta


puts "1- Directories and Subdomains\n2- Only Directories\n3- Only Subdomains\n4- Exit".light_cyan
print "Option: "
option = gets.chomp

if option == "4"
    abort("Exited".red)
end


case option
when "1"
    print "Site: ".light_cyan
    site = gets.chomp
    remove = false
    directories(site, remove)
    subdomains(site, remove)
when "2"
    print "Site: ".light_cyan
    site = gets.chomp
    remove = true
    directories(site, remove)
when "3"
    print "Site: ".light_cyan
    site = gets.chomp
    remove = true
    subdomains(site, remove)
else
    abort()
end
