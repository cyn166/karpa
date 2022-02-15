def directories(url, remove)
   
    con = 0

    total_lines = File.readlines("directories.txt").size

    puts "=============================================".magenta
    puts "          LOADED #{total_lines} LINES"
    puts "=============================================".magenta

    if remove
        results_file = File.new("results.txt", "w")
        results_file.puts ''
        results_file.close
    end
    results_file = File.new("results.txt", "a")

    results_file.puts "=== DIRECTORIES:"

    File.open("directories.txt").each do |line|
        con += 1 

        begin
            res = RestClient.get("#{url.gsub("/", "")}/#{line.gsub("\n", "")}/")
            puts "#{"#{url.gsub("/", "")}/#{line.gsub("\n", "")}/"} FOUND  -- LINE: #{con}".green
            results_file.puts "#{"#{url.gsub("/", "")}/#{line.gsub("\n", "")}/"} FOUND"
        rescue RestClient::NotFound => e
        end
    end
end
