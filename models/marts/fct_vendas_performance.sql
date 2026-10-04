select
    id_pedido,
    sk_vendedor,
    valor_total,
    lucro_liquido,
    valor_imposto
from {{ ref('int_vendas__enriquecidas') }}
