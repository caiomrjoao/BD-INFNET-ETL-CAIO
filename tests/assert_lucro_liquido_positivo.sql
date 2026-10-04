-- Passa se retornar zero registros
select
    id_pedido,
    valor_total,
    valor_frete,
    lucro_liquido
from {{ ref('int_vendas__enriquecidas') }}
where lucro_liquido < 0