def transpose_assembly_code(original_code):

    lines = original_code.strip().split('\n')


    sections = []
    current_section = []


    def add_section():
        nonlocal current_section
        if current_section:
            sections.append(current_section)
            current_section = []


    for line in lines:

        current_section.append(line.strip())

        if line.strip().startswith(('MOV', 'AND', 'OR', 'PUSH', 'POP', 'LEAVE', 'RETN', 'XOR', 'JMP', 'TEST')) and len(sections) < 2:
            add_section()


    add_section()


    transposed_code = []
    for i, section in enumerate(sections):
        label = f'sec{i + 1}'
        transposed_code.append(f'{label}:')
        transposed_code.extend(section)
        if i < len(sections) - 1:
            transposed_code.append(f'JMP sec{i + 2}')

    return '\n'.join(transposed_code)


file = 'xcr'


with open(file, 'r') as f:
    original_code = f.read()


transposed_code = transpose_assembly_code(original_code)


output_file = f'{file}_with_transposed_code'
with open(output_file, 'w') as f:
    f.write(transposed_code)


