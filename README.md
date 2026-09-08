# LLM AI Lab

Local AI lab for running and experimenting with Large Language Models (LLMs) using Llamafile and optimized GGUF models, enabling private, offline AI inference directly on local hardware.

## Components

- **Llamafile**: Execution program by Mozilla that acts as the engine and chat interface to run artificial intelligence locally on the computer.
  - [Source](https://github.com/mozilla-ai/llamafile/releases): Downloaded `llamafile-0.10.5` from Assets.
- **Model (GGUF)**: AI model stored in the GGUF format, optimized and quantized for efficient local execution with lower memory usage.
  - Source: Hugging Face (Models, Libraries: GGUF)
  - **What is Unsloth?** Unsloth is a highly specialized framework that makes AI models train and convert significantly faster, with lower memory usage while retaining high accuracy.

## Download Commands

```bash
pip install -U huggingface_hub
hf download Qwen/Qwen2.5-3B-Instruct-GGUF qwen2.5-3b-instruct-q4_k_m.gguf --local-dir .
```

Make sure the Python and Scripts folders are included in the Environment Variables `PATH`:

- `C:\Program Files\Python\Python314`
- `C:\Program Files\Python\Python314\Scripts`
- `C:\Users\<USERNAME>\AppData\Roaming\Python\Python314\Scripts`

## Execution Parameters

| Parameter                              | Description                                                                                                                                                |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `--gpu <backend>`                      | Selects the inference backend: `cpu` forces CPU inference, while `nvidia` uses the NVIDIA GPU backend when sufficient VRAM is available.                   |
| `-ngl 999`                             | Attempts to offload all possible model layers to the GPU, maximizing GPU acceleration. The actual number of layers offloaded is limited by available VRAM. |
| `-c 4096`                              | Sets the context window to 4096 tokens (the amount of conversation/history the AI can keep in active context).                                             |
| `--parallel 1`                         | Allows 1 simultaneous inference sequence/request.                                                                                                          |
| `--jinja`                              | Enables Jinja chat templates for proper formatting of the model's prompts.                                                                                 |
| `--reasoning off`                      | Disables reasoning mode.                                                                                                                                   |
| `--cors-origins http://127.0.0.1:8080` | Allows requests from the local web interface running at this origin.                                                                                       |

## Memory & Hardware Profile

> **Example configuration:** The values below describe one example system and are not general requirements for running the model.

- **System Total RAM:** 24 GB
- **Dedicated GPU VRAM:** ~2 GB
- **Inference Backend:** CPU
  - NVIDIA GPU inference is not practical for this configuration due to limited VRAM.

- **Context Window:** 4096 tokens
- **Model:** `qwen2.5-3b-instruct-q4_k_m.gguf`
- **Estimated Model RAM Usage:** ~4–6 GB, depending on context size and KV-cache usage.
- **Approximate RAM Remaining:** ~18–20 GB before accounting for the operating system and other applications.
- **System Status:** Suitable for CPU inference with this model and configuration.

## Execution Command — CPU

```bat
@echo off
llamafile-0.10.5.exe --server --host 127.0.0.1 --port 8080 --model .\models\qwen2.5-3b-instruct-q4_k_m.gguf --gpu cpu -c 4096 --parallel 1 --jinja --reasoning off --cors-origins http://127.0.0.1:8080
pause
```

## Models

| Model                            | Source       | GGUF    | Capability                                            | Recommendation                             |
| -------------------------------- | ------------ | ------- | ----------------------------------------------------- | ------------------------------------------ |
| **Llama 3.2 3B Instruct Q4_K_M** | Meta         | Unsloth | Lightweight general chat/writing/basic coding         | Good fast alternative.                     |
| **Qwen2.5 3B Instruct Q4_K_M**   | Alibaba/Qwen | Qwen    | Fast general assistant + basic coding                 | Best lightweight/default model.            |
| **Qwen3 8B Q5_K_M**              | Alibaba/Qwen | Qwen    | Stronger reasoning, coding, writing and general tasks | Best overall for your 24 GB RAM PC.        |
| **Qwen3-Coder 30B-A3B Q3_K_M**   | Alibaba/Qwen | Unsloth | Advanced coding, debugging and agentic programming    | Best coding quality, but CPU-heavy/slower. |
