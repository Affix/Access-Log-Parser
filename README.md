Apache Log File Analysis
===============
Analyses an apache log file and produces :
* Total Megabytes Sent
* Mean Response Time
* Successful Requests per Minute
* Error Requests Per Minutes

Requirements
------------
 - Apache Web Access Log

Usage
-----
```[user@computer ~]# ./parse.rb access.log
Apache Access Log Parser
Total Requests : 318655
Successful RPM : 1035
Error RPM      : 2
Total MB Sent  : 4924mb (5163689655 bytes)
Mean Response  : 356946µs```


Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors :
* Keiran 'Affix' Smith


License : GNU/GPLv3

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
