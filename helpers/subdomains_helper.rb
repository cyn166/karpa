def subdomains(url, remove)
   
    con = 0

    total_lines = File.readlines("subdomains.txt").size

    puts "=============================================".magenta
    puts "          LOADED #{total_lines} LINES"
    puts "=============================================".magenta

    if remove
        results_file = File.new("results.txt", "w")
        results_file.puts ''
        results_file.close
    end

    results_file = File.new("results.txt", "a")

    results_file.puts "=== SUBDOMAINS:"

    url = url.gsub(/^[a-zA-Z]+:\/\//, "").gsub(/(\/(.+)?)/, "")

    File.open("subdomains.txt").each do |line|
        con += 1 

        begin
            res = RestClient.get("#{line.gsub("\n", "")}#{url}")
            puts "#{line.gsub("\n", "")}#{url} FOUND  -- LINE: #{con}".green
            results_file.puts "#{line.gsub("\n", "")}#{url} FOUND"
        rescue SocketError => e
        end
    end
end
