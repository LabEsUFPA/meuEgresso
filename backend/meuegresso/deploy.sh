#!/bin/bash

cat << EOF > run.sh
#!/bin/bash
`grep "=" .env | tr '\n' ' '`mvn install
EOF

bash run.sh