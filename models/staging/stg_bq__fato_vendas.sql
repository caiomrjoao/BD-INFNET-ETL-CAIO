with source as (
    select * from {{ source('bq_source', 'fato_vendas') }}
),

renamed as (
    select
        cast(pedido_id as string) as id_pedido,
        cast(pedido_item_id as int64) as id_item_pedido,
        cast(vendedor_sk as int64) as sk_vendedor,
        cast(produto_sk as int64) as sk_produto,
        cast(cliente_sk as int64) as sk_cliente,
        cast(valorTotalItem as numeric) as valor_total,
        cast(valorFrete as numeric) as valor_frete,
        cast(valorItem as numeric) as valor_item,
        dataCompra_sk,
        dataEntrega_sk
    from source
)

select * from renamed