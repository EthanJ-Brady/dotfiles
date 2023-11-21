def prompt(message: str, options: list) -> str:
    """Prompt the user with a message and a list of options."""
    print(message)
    for i, option in enumerate(options):
        print(f"{i}. {option}")
    while True:
        try:
            choice = int(input(">>> "))
            if choice < 0 or choice > len(options) - 1:
                raise ValueError
            return options[choice]
        except ValueError:
            print("Invalid choice. Try again.")
