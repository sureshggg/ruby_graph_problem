RailRoad is solving the graph related problems mentioned in problem.txt

################################################################
How to run the program
------------------------------------------
$ ruby bin/railroadrunner < sample_inputs/input.txt
RailRoad Runner
---------------
Please input vertices with following format
Eg. A B 10
1. The distance of the route A-B-C
Output #1: 9
2. The distance of the route A-D
Output #2: 5
3. The distance of the route A-D-C
Output #3: 13
4. The distance of the route A-E-B-C-D
Output #4: 22
5. The distance of the route A-E-D
Output #5: NO SUCH ROUTE
6. Number of trips  C to C, maximum of 3 stops
Output #6: 2
7. Number of trips A to C, exactly  4 stops
Output #7: 3
8. Shortest route  distance A to C
Output #8: 9
9. Shortest route  distance B to B
Output #9: 9
10. The number of  different routes C to C
Output #10: 7

or

$ ruby bin/railroadrunner 
Input Edges with space seperated Eg. A B 10

################################################################

To run the  test:

rake
C:/Ruby21-x64/bin/ruby.exe -I"lib;test;." -I"C:/Ruby21-x64/lib/ruby/gems/2.1.0/gems/rake-10.4.2/lib" "C:/Ruby21
.rb" "test/priority_queue_test.rb"
Run options: --seed 64657

# Running:

......

Finished in 0.003774s, 1589.6929 runs/s, 8743.3107 assertions/s.

6 runs, 33 assertions, 0 failures, 0 errors, 0 skips

################################################################
