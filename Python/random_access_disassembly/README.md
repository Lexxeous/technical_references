# basic_blocks.py

### How to Run:

You can run `basic_blocks.py` manually using:

```bash
python3 basic_blocks.py <executable_path> [space_separated_list_of_values]
```

where `<executable_path>` can also be `` `which <executable_name>` ``.

#### Using Make:

Alternatively, you can take advantage of the `Makefile` by using:

```bash
make <executable_name>
```

which will disassemble all of the basic blocks for an exacutable called `<executable_name>`.

To include a list of manual leaders, use:

```bash
make <executable_name> [leaders=<value>\ <value>\ ... \ <value>]
```

where the list of values is separated by escaped space characters "`\ `".

### Output Files:

The output of all basic blocks is to a file called `basic_blocks.txt`.

The .text section and the entire `<explore>` list is outputted to a file called `text_section.txt`.

### Cleaning Up:

Using `make clean` will remove these two output files. They will be recreated upon running the program again.