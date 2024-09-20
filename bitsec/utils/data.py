import os
import random

SAMPLE_DIR = os.path.join(os.path.dirname(__file__), '..', '..', 'samples')

def get_solidity_sample() -> str:
    if not os.path.exists(SAMPLE_DIR):
        raise FileNotFoundError(f"Sample directory not found: {SAMPLE_DIR}")

    """Load a random Solidity code sample from the samples directory."""
    sample_files = [f for f in os.listdir(SAMPLE_DIR) if f.endswith('.sol')]
    if not sample_files:
        raise ValueError("No Solidity sample files found")
    
    sample_file = os.path.join(SAMPLE_DIR, random.choice(sample_files))
    with open(sample_file, 'r') as file:
        return file.read()
       
def create_challenge(code: str) -> str:
    ## add layers of noise to make challenge harder
    return code