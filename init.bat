@echo off
llamafile-0.10.5.exe --server --host 127.0.0.1 --port 8080 --model .\models\qwen2.5-3b-instruct-q4_k_m.gguf --gpu cpu -c 4096 --parallel 1 --jinja --reasoning off --cors-origins http://127.0.0.1:8080
pause