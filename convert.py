import re

# Function to read and parse quotes from the file
def parse_quotes(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()

    # Regular expression to match quotes and authors
    pattern = re.compile(r'"(.*?)"\s*-\s*(.*?)(?:\n|$)', re.DOTALL)
    matches = pattern.findall(content)
    
    return matches

# Function to convert parsed quotes to Swift array format
def convert_to_swift(quotes):
    swift_quotes = "let quotes: [[String: Any]] = [\n"
    for quote, author in quotes:
        swift_quotes += f'    ["quote": "{quote}", "author": "{author}"],\n'
    swift_quotes = swift_quotes.rstrip(",\n") + "\n]"
    return swift_quotes

# Path to the quotes.txt file
file_path = "quotes.txt"

# Parse quotes from the file
quotes = parse_quotes(file_path)

# Convert to Swift array format
swift_code = convert_to_swift(quotes)

# Print the Swift code
print(swift_code)

