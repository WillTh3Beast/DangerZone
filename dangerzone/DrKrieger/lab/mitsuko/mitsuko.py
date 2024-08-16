import time

def draw_mitsuko():
    mitsuko_face = r"""
       ____________
      /            \
     |  O       O  |
     |      ^      |
     |    \___/    |
      \___________/
    """
    print(mitsuko_face)


def mitsuko_greeting():
    greetings = [
        "I'm Mitsuko Miyazumi. I didn't come all the way from Japan to deal with idiots.",
        "Don't waste my time. I have work to do.",
        "You do realize this is important, right?",
    ]
    for line in greetings:
        print(line)
        time.sleep(1.5)


def main():
    draw_mitsuko()
    time.sleep(1)
    mitsuko_greeting()

    user_input = input("\nYou: ")

    if "hello" in user_input.lower():
        print("\nMitsuko: 'Hello'... is that all you have to say?")
    elif "help" in user_input.lower():
        print("\nMitsuko: If you need help, you better be ready to keep up.")
    else:
        print("\nMitsuko: Honestly, this is beneath me.")
    
    print("\nMitsuko: I'm leaving now. Don't make me regret coming here.")
    
    time.sleep(1.5)
    draw_mitsuko()
    print("Oh I almost forgot! You should check the git logs (git log | cat)")
    print("Bye bye")

if __name__ == "__main__":
    main()

