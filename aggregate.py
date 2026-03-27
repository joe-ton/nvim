import os
from pathlib import Path

def aggregate_lua_files(root_dir: str = ".", output_file: str = "dump.txt"):
    """
    ONLY looks for .lua files (ignores everything else: json, md, LICENSE, etc.).
    Recursively scans the whole folder and subfolders.
    Dumps each file's full relative path + its exact code into dump.txt.
    """
    root_path = Path(root_dir).resolve()
    if not root_path.exists():
        print(f"Directory not found: {root_path}")
        return

    print(f"Scanning for .lua files in: {root_path}")
    print(f"Output will be: {output_file}")

    with open(output_file, "w", encoding="utf-8") as outfile:
        # Header
        outfile.write("=== LUA FILES DUMP ===\n")
        outfile.write(f"Root: {root_path}\n")
        outfile.write("=" * 80 + "\n\n")

        # Get every .lua file recursively, sorted
        for file_path in sorted(root_path.rglob("*.lua")):
            if file_path.is_file():
                rel_path = file_path.relative_to(root_path)

                outfile.write(f"=== FILE: {rel_path} ===\n")
                outfile.write("=" * 80 + "\n\n")

                try:
                    with open(file_path, "r", encoding="utf-8") as infile:
                        content = infile.read()
                    outfile.write(content)
                except Exception as e:
                    outfile.write(f"[ERROR reading file: {e}]\n")

                outfile.write("\n\n" + "=" * 80 + "\n\n")

    print(f"Done. All .lua files aggregated into: {output_file}")

if __name__ == "__main__":
    # Run this while you are inside ~/.c/nvim
    aggregate_lua_files()
