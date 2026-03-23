## anythingllm_mcp_servers.json

Đây là file cấu hình để AnythingLLM biết **có những MCP server nào** và **cách khởi động chúng** (dùng lệnh gì, biến môi trường gì). AnythingLLM đọc file này để kết nối agent với các công cụ bên ngoài như GitHub, filesystem, database, v.v.

```
my-project/
├── docker-compose.yml
└── storage/
    └── plugins/
        └── anythingllm_mcp_servers.json  ← đây
```